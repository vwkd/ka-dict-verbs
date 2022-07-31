# OCR Scan with Google Cloud Vision API



## Prerequisites

- scan of dictionary, e.g. PDF file, image files
- terminal with `gcloud` installed, e.g. Google Cloud Console
- Google Cloud account
- beware: Google Cloud Vision API and Google Cloud Storage [pricing and limits](https://cloud.google.com/vision/docs/detect-labels-image-api) ❗️


## Preparation

- [set up project](https://cloud.google.com/vision/docs/setup)
  - create new project
  - create new billing account, if not already exists
  - create new billing alert, if not already exists
  - enable Vision API
- [set up authentication](https://cloud.google.com/docs/authentication/production)
  - create new service account
  - authenticate locally, e.g. Google Cloud Shell
      - upload JSON key to ephemeral file hoster, e.g. fileIO
      - download key locally
```
wget URL -O key.json
```
      - export credentials in `.bashrc` locally
```
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/key.json"
```
      - authenticate locally
```sh
gcloud auth activate-service-account --key-file="key.json"
```
      - get access token locally
```sh
gcloud auth application-default print-access-token
```
- [set up request with HTTP client](https://cloud.google.com/vision/docs/pdf)

- with OAuth 2.0 Access Token
- with Operation ID from response

```txt
POST https://vision.googleapis.com/v1/files:asyncBatchAnnotate

Content-Type: application/json
Authorization:Bearer TOKEN
X-Goog-User-Project: PROJECT-ID

{
  "requests":[
    {
      "inputConfig": {
        "gcsSource": {
          "uri": "gs://MY-BUCKET/MY-PDF-FILE.pdf"
        },
        "mimeType": "application/pdf"
      },
      "features": [
        {
          "type": "DOCUMENT_TEXT_DETECTION"
        }
      ],
      "imageContext": {
        "languageHints": [
          "de",
          "ka"
        ]
      },
      "outputConfig": {
        "gcsDestination": {
          "uri": "gs://MY-BUCKET/"
        },
        "batchSize": 1
      }
    }
  ]
}
```

- [set up request with HTTP client](https://cloud.google.com/vision/docs/pdf)

```
GET https://vision.googleapis.com/v1/operations/OPERATION_ID
```
- with OAuth 2.0 Access Token
- with Operation ID from response



## Preprocessing

- optionally split page if multiple columns, Google Vision API can recognize if not too tight
- crop out unrelated text)
- combine to single PDF file



## Scan

- upload PDF to Google Cloud Bucket
- run OCR by making HTTP request
- download result JSON files
  - download files locally
```
mkdir out
gsutil -m cp -r "gs://BUCKET/" out
```
  - create ZIP locally
```
zip a.zip -r out
```
  - upload ZIP to ephemeral file hoster API locally, e.g. ki.tc
```
curl -F "file=@a.zip" https://ki.tc/file/u/
```
  - download files



## Postprocessing

- fix misrecognized characters, symbols, "1" and "l", etc.
- move bracketed extension on corresponding line above / below
- remove line breaks and hyphens
- fix print errors, e.g. spurious commas, double colon instead of semicolon, etc.
- preserve font styles, e.g. `{fig}`, etc.
- beware: keep original, don't yet transform into own dictionary, e.g. change formatting, grammar, etc. ❗️