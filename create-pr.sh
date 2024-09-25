#!/bin/bash

# Variables
REPO="UKHomeOffice/inquiry-charts"
BRANCH_NAME="update-chart-${DRONE_TAG}"
PR_TITLE="Update Helm chart version to ${DRONE_TAG}"
GITHUB_API="https://api.github.com/repos/$REPO"
COMMIT_MESSAGE="Update Helm chart version to ${DRONE_TAG} and update index.yaml"
GITHUB_TOKEN=$1  # Pass GitHub token as an argument

# 1. Create a new branch from the current commit
git checkout -b "$BRANCH_NAME"

# 2. Update the Chart.yaml with the new version
sed -i "s/^version:.*/version: ${DRONE_TAG}/" Chart.yaml
sed -i "s/^appVersion:.*/appVersion: ${DRONE_TAG}/" Chart.yaml

# 3. Commit the changes
git add Chart.yaml index.yaml
git commit -m "$COMMIT_MESSAGE"

# 4. Push the branch to GitHub
git push "https://${GITHUB_TOKEN}@github.com/$REPO.git" "$BRANCH_NAME"

# 5. Create a pull request using GitHub API
PR_RESPONSE=$(curl -X POST -H "Authorization: token $GITHUB_TOKEN" -d "{\"title\":\"$PR_TITLE\", \"head\":\"$BRANCH_NAME\", \"base\":\"main\"}" $GITHUB_API/pulls)

# 6. Output the pull request URL (optional)
echo "Pull request created: $(echo $PR_RESPONSE | jq -r '.html_url')"
