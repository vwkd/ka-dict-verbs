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
  - preserve symbols, for alternatives
  - preserve boldness, for root
  - preserve cursiveness, for gender
- do checks
  - words are in alphabetical order
  - entry is in numerical order, has semicolon everywhere, etc.



## Postprocessing

- find `[`, move to previous or following line



## Parse

- index word
  - root (bold)
  - infinitive for verb
- definition
  - separate non-full lines
  - separate by numbers
  - separate by semicolons
  - separate by Georgian and German