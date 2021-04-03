# dc.services.visualstudio.com
# vortex.data.microsoft.com
TELEMETRY_URLS="(dc\.services\.visualstudio\.com)|(vortex\.data\.microsoft\.com)"
REPLACEMENT="s/$TELEMETRY_URLS/0\.0\.0\.0/g"

grep -rl --exclude-dir=.git -E $TELEMETRY_URLS . | xargs sed -i -E $REPLACEMENT
