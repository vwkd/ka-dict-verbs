## Create dictionary



## Prerequisites

- OCR text files of dictionary



## Corrections

- correct mistakes, e.g. ":"
- use modern grammar, e.g. "ck" instead of "kk", "ß" instead of "ss"
- make consistent, e.g. "z.B." instead of "z. B."
- expand shorthands, e.g. "zusammen" instead of "zs", "jemand" instead of "jmd", etc.
- expand shorthands accross fields, e.g. "XYZ, X.", "X-, Y-Z", "Z-X, -Y", etc.
- check grammar
- check alphabetic sort
- create unified tag syntax, e.g. `{fig.}`, `{ugs.}`, etc.



## Formatting (MAYBE)

- replace ORs with comma, e.g. "X od. Y", "X/Y", etc.
- make comma separated fields atomic
- split entries into separate nested fields
  - by letters, e.g. I, II, etc.
  - by letters, e.g. A, B, etc.
  - by numbers, e.g. 1., 2., etc.
  - by semicolons
  - ~~by commas~~ (beware: not used as atomic fields!)
- replace multiple entries with superscript numbers with single entry with multiple fields



## Import

- replace first space with unique separator, e.g. `^([^ ]+) ` with `$1@` and multiline match
- import as CSV with unique separator