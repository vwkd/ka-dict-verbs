# Steps



## Preparation

- get scan, e.g. PDF file, image files
- terminal with `gcloud` installed, e.g. Google Cloud Console

### Google Cloud

- [set up project](https://cloud.google.com/vision/docs/setup)
  - create new project
  - create new billing account, if not already exists
  - create new billing alert, if not already exists
  - enable Vision API
- [set up authentication](https://cloud.google.com/docs/authentication/production)
  - create new service account
  - save new JSON key locally, e.f. `key.json`
  - export credentials locally, e.g. in `.bashrc`
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



## Preprocessing

- split page if multiple columns
- crop out unrelated text
- combine to single PDF file



## Scan

- upload PDF to Google Cloud Bucket
- run OCR by making HTTP request
- download result JSON files



## Postprocessing

- fix misrecognized characters, symbols, etc.
- move bracketed extension on corresponding line above / below
- remove line breaks and hyphens