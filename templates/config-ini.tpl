{{- define "mylarConfigIniContent" -}}
[Client]
nzb_downloader = {{ .Values.managedConfig.client.nzbDownloader | default "1" }}
torrent_downloader = {{ .Values.managedConfig.client.torrentDownloader | default "2" }}

[General]
ignore_havetotal = {{ .Values.managedConfig.general.ignoreHaveTotal | default "False" }}
sabdockernzb = {{ .Values.managedConfig.general.sabdockernzb | default "False" }}
create_folders = {{ .Values.managedConfig.general.createFolders | default "True" }}
rename_files = {{ .Values.managedConfig.general.renameFiles | default "True" }}
lowercase_filenames = {{ .Values.managedConfig.general.lowercaseFilenames | default "True" }}
failed_download_handling = {{ .Values.managedConfig.general.failedDownloadHandling | default "True" }}
enable_rss = {{ .Values.managedConfig.general.enableRss | default "True" }}
annuals_on = {{ .Values.managedConfig.general.annualsOn | default "True" }}
destination_dir = {{ .Values.managedConfig.paths.comics | default "/comics" }}
download_dir = {{ .Values.managedConfig.paths.downloads | default "/downloads" }}

[Import]
imp_paths = {{ .Values.managedConfig.import.paths | default "False" }}
imp_metadata = {{ .Values.managedConfig.import.metadata | default "True" }}
comic_dir = {{ .Values.managedConfig.paths.comics | default "/comics" }}
imp_move = {{ .Values.managedConfig.import.move | default "True" }}
imp_rename = {{ .Values.managedConfig.import.rename | default "True" }}
add_comics = {{ .Values.managedConfig.import.addComics | default "True" }}
imp_seriesfolders = {{ .Values.managedConfig.import.seriesFolders | default "True" }}

[Scheduler]
search_interval = {{ .Values.managedConfig.scheduler.searchInterval | default "360" }}
rss_checkinterval = {{ .Values.managedConfig.scheduler.rssCheckInterval | default "20" }}
download_scan_interval = {{ .Values.managedConfig.scheduler.downloadScanInterval | default "5" }}
check_github_interval = {{ .Values.managedConfig.scheduler.checkGithubInterval | default "360" }}
blocklist_timer = {{ .Values.managedConfig.scheduler.blocklistTimer | default "3600" }}

[Interface]
http_password = __HTTP_PASSWORD__
https_chain = {{ .Values.managedConfig.interface.httpsChain | default "None" }}
authentication = {{ .Values.managedConfig.interface.authentication | default "0" }}
http_port = {{ .Values.managedConfig.interface.httpPort | default "8090" }}
login_timeout = {{ .Values.managedConfig.interface.loginTimeout | default "43800" }}
http_root = {{ .Values.managedConfig.interface.httpRoot | default "/" }}
https_force_on = {{ .Values.managedConfig.interface.httpsForceOn | default "False" }}
https_cert = {{ .Values.managedConfig.interface.httpsCert | default "None" }}
http_host = {{ .Values.managedConfig.interface.httpHost | default "0.0.0.0" }}
enable_https = {{ .Values.managedConfig.interface.enableHttps | default "False" }}
https_key = {{ .Values.managedConfig.interface.httpsKey | default "None" }}
host_return = {{ .Values.managedConfig.interface.hostReturn | default "None" }}
http_username = __HTTP_USERNAME__
alphaindex = {{ .Values.managedConfig.interface.alphaindex | default "True" }}
cherrypy_logging = {{ .Values.managedConfig.interface.cherrypyLogging | default "False" }}

[CV]
cv_verify = {{ .Values.managedConfig.cv.verify | default "True" }}
cv_only = {{ .Values.managedConfig.cv.only | default "True" }}
cvinfo = {{ .Values.managedConfig.cv.info | default "True" }}
comicvine_api = __COMICVINE_API__
cv_onetimer = {{ .Values.managedConfig.cv.onetimer | default "True" }}
cvapi_rate = {{ .Values.managedConfig.cv.apiRate | default "2" }}
ignored_publishers = {{ .Values.managedConfig.cv.ignoredPublishers | default "" }}
cv_user_agent = {{ .Values.managedConfig.cv.userAgent | default "Mozilla/5.0" }}

[API]
api_key = __API_KEY__
api_enabled = {{ .Values.managedConfig.api.enabled | default "True" }}

[Perms]
chmod_file = {{ .Values.managedConfig.perms.chmodFile | default "0660" }}
chowner = {{ .Values.managedConfig.perms.chowner | default "1001" }}
enforce_perms = {{ .Values.managedConfig.perms.enforcePerms | default "True" }}
chmod_dir = {{ .Values.managedConfig.perms.chmodDir | default "0777" }}
chgroup = {{ .Values.managedConfig.perms.chgroup | default "1001" }}

[Logs]
log_dir = {{ .Values.managedConfig.logs.dir | default "/config/mylar/logs" }}
max_logsize = {{ .Values.managedConfig.logs.maxSize | default "10000000" }}
log_level = {{ .Values.managedConfig.logs.level | default "1" }}
max_logfiles = {{ .Values.managedConfig.logs.maxFiles | default "5" }}
{{- end -}}

