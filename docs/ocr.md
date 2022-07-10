# Steps



## Preparation

- get dictionary DJVU
- install DJVU to image converter
- install tesseract



## Preprocessing

- convert DJVU to images (TIFF?)
- discard images
  - discard introduction
  - discard empty pages
- categorize images
  - abbreviations
  - dictionary pages
  - verb summaries



## Scan

- maybe train OCR on characters, e.g. 1 and l, cursive m f n, etc.
- OCR scan for each category
  - preserve indent
  - preserve boldness, for root
- do checks
  - words are in alphabetical order
  - entry is in numerical order, has semicolon everywhere, etc.



## Postprocessing

- find `[`, move to previous or following line
- move indented lines into one line



## Parse

- index word
  - root (bold)
  - infinitive for verb
- definition
  - separate by numbers
  - separate by semicolons
  - ?