# OCR Scan with Google Cloud Vision API



## Prerequisites

- scan, e.g. PDF file, image files
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

- split page if multiple columns
- crop out unrelated text
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
- beware: don't correct formatting, grammar, etc. just yet, keep original source, use separate transformation into own dictionary ❗️



## Transformations for own dictionary

- correct grammar, use modern grammar
  - run grammar checker
  - "z.B." instead of "z. B."
  - write out all shorthands, e.g. "zusammen" instead of "zs", "jemand" instead of "jmd", etc.
  - correct mistakes, e.g. ":"
- create tag syntax, e.g. `{fig}`, `{ugs}`, etc.
- split entries into separate nested fields by letters (I, II, A, B, etc.) then numbers (1., 2., etc.), then semicolons, then commas
- ??? replace multiple entries with superscript numbers with single entry with multiple fields