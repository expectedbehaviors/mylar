{{- define "mylarConfigIniContent" -}}
[Client]
nzb_downloader = 1
torrent_downloader = 2

[General]
ignore_havetotal = False
sabdockernzb = False
create_folders = {{ .Values.managedConfig.general.createFolders | default "True" }}
rename_files = {{ .Values.managedConfig.general.renameFiles | default "True" }}
lowercase_filenames = {{ .Values.managedConfig.general.lowercaseFilenames | default "True" }}
failed_download_handling = {{ .Values.managedConfig.general.failedDownloadHandling | default "True" }}
enable_rss = {{ .Values.managedConfig.general.enableRss | default "True" }}
annuals_on = {{ .Values.managedConfig.general.annualsOn | default "True" }}
destination_dir = {{ .Values.managedConfig.paths.comics | default "/comics" }}
download_dir = {{ .Values.managedConfig.paths.downloads | default "/downloads" }}

[Import]
imp_paths = False
imp_metadata = {{ .Values.managedConfig.import.metadata | default "True" }}
comic_dir = {{ .Values.managedConfig.paths.comics | default "/comics" }}
imp_move = {{ .Values.managedConfig.import.move | default "True" }}
imp_rename = {{ .Values.managedConfig.import.rename | default "True" }}
add_comics = True
imp_seriesfolders = True

[Scheduler]
search_interval = {{ .Values.managedConfig.scheduler.searchInterval | default "360" }}
rss_checkinterval = {{ .Values.managedConfig.scheduler.rssCheckInterval | default "20" }}
download_scan_interval = {{ .Values.managedConfig.scheduler.downloadScanInterval | default "5" }}
check_github_interval = 360
blocklist_timer = 3600

[Interface]
http_password = __HTTP_PASSWORD__
https_chain = None
authentication = 0
http_port = 8090
login_timeout = 43800
http_root = /
https_force_on = False
https_cert = None
http_host = 0.0.0.0
enable_https = False
https_key = None
host_return = None
http_username = __HTTP_USERNAME__
alphaindex = True
cherrypy_logging = False

[CV]
cv_verify = True
cv_only = True
cvinfo = True
comicvine_api = __COMICVINE_API__
cv_onetimer = True
cvapi_rate = 2
ignored_publishers = 
cv_user_agent = Mozilla/5.0

[API]
api_key = __API_KEY__
api_enabled = True
{{- end -}}

