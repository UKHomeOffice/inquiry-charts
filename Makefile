re-index:
	helm package ./ && \
	helm repo index . --url https://raw.githubusercontent.com/UKHomeOffice/inquiry-charts/main/
gen-doc:
	 helm-docs