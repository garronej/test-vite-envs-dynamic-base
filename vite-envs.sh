#!/bin/sh

replaceAll() {
    export inputString="$1"
    export pattern="$2"
    export replacement="$3"

    echo "$inputString" | awk '{
        gsub(ENVIRON["pattern"], ENVIRON["replacement"])
        print
    }'
}

html=$(echo "PCFET0NUWVBFIGh0bWw+PGh0bWwgbGFuZz0iZW4iPjxoZWFkPgogICAgPG1ldGEgY2hhcnNldD0iVVRGLTgiPgogICAgPGxpbmsgcmVsPSJpY29uIiB0eXBlPSJpbWFnZS9zdmcreG1sIiBocmVmPSIlQkFTRV9VUkwldml0ZS5zdmciPgogICAgPG1ldGEgbmFtZT0idmlld3BvcnQiIGNvbnRlbnQ9IndpZHRoPWRldmljZS13aWR0aCwgaW5pdGlhbC1zY2FsZT0xLjAiPgogICAgPHRpdGxlPiVUSVRMRSU8L3RpdGxlPgogICAgPG1ldGEgbmFtZT0iZGVzY3JpcHRpb24iIGNvbnRlbnQ9IiVERVNDUklQVElPTiUiPgoKICAgIDwhLS0gdml0ZS1lbnZzIHNjcmlwdCBwbGFjZWhvbGRlciB4S3NQbUxzMzBzd0tzZElzVnggLS0+PHNjcmlwdCB0eXBlPSJtb2R1bGUiIGNyb3Nzb3JpZ2luPSIiIHNyYz0iLi9hc3NldHMvaW5kZXgtQ0JrV01ObG8uanMiPjwvc2NyaXB0PgogICAgPGxpbmsgcmVsPSJzdHlsZXNoZWV0IiBjcm9zc29yaWdpbj0iIiBocmVmPSIuL2Fzc2V0cy9pbmRleC1EaXdyZ1RkYS5jc3MiPgogIDwvaGVhZD4KICA8Ym9keT4KICAgIDxkaXYgaWQ9InJvb3QiPjwvZGl2PgogIAoKPC9ib2R5PjwvaHRtbD4=" | base64 -d)

if printenv BASE_URL &> /dev/null; then
    BASE_URL_base64=$(printenv BASE_URL | base64)
else
    BASE_URL_base64="eEFwV2RSclg5OWtQclZnZ0UiL3Rlc3Qtdml0ZS1lbnZzLWR5bmFtaWMtYmFzZS8iCg=="
fi
BASE_URL=${BASE_URL:-$(echo "L3Rlc3Qtdml0ZS1lbnZzLWR5bmFtaWMtYmFzZS8K" | base64 -d)}
MODE_base64="eEFwV2RSclg5OWtQclZnZ0UicHJvZHVjdGlvbiIK"
MODE=$(echo "cHJvZHVjdGlvbgo=" | base64 -d)
DEV_base64="eEFwV2RSclg5OWtQclZnZ0VmYWxzZQo="
DEV=$(echo "ZmFsc2UK" | base64 -d)
PROD_base64="eEFwV2RSclg5OWtQclZnZ0V0cnVlCg=="
PROD=$(echo "dHJ1ZQo=" | base64 -d)
BUILD_TIME_base64="eEFwV2RSclg5OWtQclZnZ0UxNzI0MTE0MjcxNTI5Cg=="
BUILD_TIME=$(echo "MTcyNDExNDI3MTUyOQo=" | base64 -d)
VERSION_base64="eEFwV2RSclg5OWtQclZnZ0UiNC4yLjIiCg=="
VERSION=$(echo "NC4yLjIK" | base64 -d)
if printenv TITLE &> /dev/null; then
    TITLE_base64=$(printenv TITLE | base64)
else
    TITLE_base64="eEFwV2RSclg5OWtQclZnZ0UiRGVmYXVsdCBUaXRsZSDwn5qAIgo="
fi
TITLE=${TITLE:-$(echo "RGVmYXVsdCBUaXRsZSDwn5qACg==" | base64 -d)}
if printenv DESCRIPTION &> /dev/null; then
    DESCRIPTION_base64=$(printenv DESCRIPTION | base64)
else
    DESCRIPTION_base64="eEFwV2RSclg5OWtQclZnZ0UiIgo="
fi
DESCRIPTION=${DESCRIPTION:-$(echo "Cg==" | base64 -d)}

processedHtml="$html"

processedHtml=$(replaceAll "$processedHtml" "%BASE_URL%" "BASE_URLxPsZs9swrPvxYpC")
processedHtml=$(replaceAll "$processedHtml" "%MODE%" "MODExPsZs9swrPvxYpC")
processedHtml=$(replaceAll "$processedHtml" "%DEV%" "DEVxPsZs9swrPvxYpC")
processedHtml=$(replaceAll "$processedHtml" "%PROD%" "PRODxPsZs9swrPvxYpC")
processedHtml=$(replaceAll "$processedHtml" "%BUILD_TIME%" "BUILD_TIMExPsZs9swrPvxYpC")
processedHtml=$(replaceAll "$processedHtml" "%VERSION%" "VERSIONxPsZs9swrPvxYpC")
processedHtml=$(replaceAll "$processedHtml" "%TITLE%" "TITLExPsZs9swrPvxYpC")
processedHtml=$(replaceAll "$processedHtml" "%DESCRIPTION%" "DESCRIPTIONxPsZs9swrPvxYpC")

processedHtml=$(replaceAll "$processedHtml" "BASE_URLxPsZs9swrPvxYpC" "$BASE_URL")
processedHtml=$(replaceAll "$processedHtml" "MODExPsZs9swrPvxYpC" "$MODE")
processedHtml=$(replaceAll "$processedHtml" "DEVxPsZs9swrPvxYpC" "$DEV")
processedHtml=$(replaceAll "$processedHtml" "PRODxPsZs9swrPvxYpC" "$PROD")
processedHtml=$(replaceAll "$processedHtml" "BUILD_TIMExPsZs9swrPvxYpC" "$BUILD_TIME")
processedHtml=$(replaceAll "$processedHtml" "VERSIONxPsZs9swrPvxYpC" "$VERSION")
processedHtml=$(replaceAll "$processedHtml" "TITLExPsZs9swrPvxYpC" "$TITLE")
processedHtml=$(replaceAll "$processedHtml" "DESCRIPTIONxPsZs9swrPvxYpC" "$DESCRIPTION")

json=""
json="$json{"
json="$json\"BASE_URL\":\`$BASE_URL_base64\`,"
json="$json\"MODE\":\`$MODE_base64\`,"
json="$json\"DEV\":\`$DEV_base64\`,"
json="$json\"PROD\":\`$PROD_base64\`,"
json="$json\"BUILD_TIME\":\`$BUILD_TIME_base64\`,"
json="$json\"VERSION\":\`$VERSION_base64\`,"
json="$json\"TITLE\":\`$TITLE_base64\`,"
json="$json\"DESCRIPTION\":\`$DESCRIPTION_base64\`"
json="$json}"

script="
    <script data-script-description=\"Environment variables injected by vite-envs\">
      var envWithValuesInBase64 = $json;
      var env = {};
      Object.keys(envWithValuesInBase64).forEach(function (name) {
        const value = new TextDecoder().decode(
          Uint8Array.from(
            atob(envWithValuesInBase64[name]),
            c => c.charCodeAt(0))
        ).slice(0,-1);
        env[name] = value.startsWith(\"xApWdRrX99kPrVggE\") ? JSON.parse(value.slice(\"xApWdRrX99kPrVggE\".length)) : value;
      });
      window.__VITE_ENVS = env;
    </script>"

scriptPlaceholder="<!-- vite-envs script placeholder xKsPmLs30swKsdIsVx -->"

processedHtml=$(replaceAll "$processedHtml" "$scriptPlaceholder" "$script")

DIR=$(cd "$(dirname "$0")" && pwd)

echo "$processedHtml" > "$DIR/index.html"

swEnv_script="
const envWithValuesInBase64 = $json;
const env = {};
Object.keys(envWithValuesInBase64).forEach(function (name) {
  const value = new TextDecoder().decode(
    Uint8Array.from(
      atob(envWithValuesInBase64[name]),
      c => c.charCodeAt(0))
  ).slice(0,-1);
  env[name] = value.startsWith(\"xApWdRrX99kPrVggE\") ? JSON.parse(value.slice(\"xApWdRrX99kPrVggE\".length)) : value;
});
self.__VITE_ENVS = env;
"

echo "$swEnv_script" > "$DIR/swEnv.js"
