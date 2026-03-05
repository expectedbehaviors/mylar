{{- define "mylarIniBool" -}}{{- if . }}True{{ else }}False{{ end }}{{- end -}}
{{- define "mylarConfigIniContent" -}}
[Client]
nzb_downloader = {{ .Values.managedConfig.client.nzbDownloader | default 1 }}
torrent_downloader = {{ .Values.managedConfig.client.torrentDownloader | default 2 }}

[General]
ignore_havetotal = {{ include "mylarIniBool" ( .Values.managedConfig.general.ignoreHaveTotal | default false ) }}
sabdockernzb = {{ include "mylarIniBool" ( .Values.managedConfig.general.sabdockernzb | default false ) }}
create_folders = {{ include "mylarIniBool" ( .Values.managedConfig.general.createFolders | default true ) }}
rename_files = {{ include "mylarIniBool" ( .Values.managedConfig.general.renameFiles | default true ) }}
lowercase_filenames = {{ include "mylarIniBool" ( .Values.managedConfig.general.lowercaseFilenames | default true ) }}
failed_download_handling = {{ include "mylarIniBool" ( .Values.managedConfig.general.failedDownloadHandling | default true ) }}
enable_rss = {{ include "mylarIniBool" ( .Values.managedConfig.general.enableRss | default true ) }}
annuals_on = {{ include "mylarIniBool" ( .Values.managedConfig.general.annualsOn | default true ) }}
destination_dir = {{ .Values.managedConfig.paths.comics | default "/comics" }}
download_dir = {{ .Values.managedConfig.paths.downloads | default "/downloads" }}

[Import]
imp_paths = {{ include "mylarIniBool" ( .Values.managedConfig.import.paths | default false ) }}
imp_metadata = {{ include "mylarIniBool" ( .Values.managedConfig.import.metadata | default true ) }}
comic_dir = {{ .Values.managedConfig.paths.comics | default "/comics" }}
imp_move = {{ include "mylarIniBool" ( .Values.managedConfig.import.move | default true ) }}
imp_rename = {{ include "mylarIniBool" ( .Values.managedConfig.import.rename | default true ) }}
add_comics = {{ include "mylarIniBool" ( .Values.managedConfig.import.addComics | default true ) }}
imp_seriesfolders = {{ include "mylarIniBool" ( .Values.managedConfig.import.seriesFolders | default true ) }}

[Scheduler]
search_interval = {{ .Values.managedConfig.scheduler.searchInterval | default 360 }}
rss_checkinterval = {{ .Values.managedConfig.scheduler.rssCheckInterval | default 20 }}
download_scan_interval = {{ .Values.managedConfig.scheduler.downloadScanInterval | default 5 }}
check_github_interval = {{ .Values.managedConfig.scheduler.checkGithubInterval | default 360 }}
blocklist_timer = {{ .Values.managedConfig.scheduler.blocklistTimer | default 3600 }}

[Interface]
http_password = __HTTP_PASSWORD__
https_chain = {{ .Values.managedConfig.interface.httpsChain | default "None" }}
authentication = {{ .Values.managedConfig.interface.authentication | default 0 }}
http_port = {{ .Values.managedConfig.interface.httpPort | default 8090 }}
login_timeout = {{ .Values.managedConfig.interface.loginTimeout | default 43800 }}
http_root = {{ .Values.managedConfig.interface.httpRoot | default "/" }}
https_force_on = {{ include "mylarIniBool" ( .Values.managedConfig.interface.httpsForceOn | default false ) }}
https_cert = {{ .Values.managedConfig.interface.httpsCert | default "None" }}
http_host = {{ .Values.managedConfig.interface.httpHost | default "0.0.0.0" }}
enable_https = {{ include "mylarIniBool" ( .Values.managedConfig.interface.enableHttps | default false ) }}
https_key = {{ .Values.managedConfig.interface.httpsKey | default "None" }}
host_return = {{ .Values.managedConfig.interface.hostReturn | default "None" }}
http_username = __HTTP_USERNAME__
alphaindex = {{ include "mylarIniBool" ( .Values.managedConfig.interface.alphaindex | default true ) }}
cherrypy_logging = {{ include "mylarIniBool" ( .Values.managedConfig.interface.cherrypyLogging | default false ) }}

[CV]
cv_verify = {{ include "mylarIniBool" ( .Values.managedConfig.cv.verify | default true ) }}
cv_only = {{ include "mylarIniBool" ( .Values.managedConfig.cv.only | default true ) }}
cvinfo = {{ include "mylarIniBool" ( .Values.managedConfig.cv.info | default true ) }}
comicvine_api = __COMICVINE_API__
cv_onetimer = {{ include "mylarIniBool" ( .Values.managedConfig.cv.onetimer | default true ) }}
cvapi_rate = {{ .Values.managedConfig.cv.apiRate | default 2 }}
ignored_publishers = {{ .Values.managedConfig.cv.ignoredPublishers | default "" }}
cv_user_agent = {{ .Values.managedConfig.cv.userAgent | default "Mozilla/5.0" }}

[API]
api_key = __API_KEY__
api_enabled = {{ include "mylarIniBool" ( .Values.managedConfig.api.enabled | default true ) }}

[Perms]
chmod_file = {{ .Values.managedConfig.perms.chmodFile | default "0660" }}
chowner = {{ .Values.managedConfig.perms.chowner | default "1001" }}
enforce_perms = {{ include "mylarIniBool" ( .Values.managedConfig.perms.enforcePerms | default true ) }}
chmod_dir = {{ .Values.managedConfig.perms.chmodDir | default "0777" }}
chgroup = {{ .Values.managedConfig.perms.chgroup | default "1001" }}

[Logs]
log_dir = {{ .Values.managedConfig.logs.dir | default "/config/mylar/logs" }}
max_logsize = {{ .Values.managedConfig.logs.maxSize | default 10000000 }}
log_level = {{ .Values.managedConfig.logs.level | default 1 }}
max_logfiles = {{ .Values.managedConfig.logs.maxFiles | default 5 }}
{{- end -}}

