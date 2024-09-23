re-index:
	helm package ./ && \
	helm repo index . --url https://github.com/UKHomeOffice/inquiry-charts/releases/download/1.0.0/
gen-doc:
	 helm-docs