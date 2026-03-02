/// Gives hints to the report exporting util. Hints are a workaround around the
/// fact that we need to work with tables. Hints can be used for giving, well,
/// hints to the exporter.
///
/// 'title' hint tells the pdf exporting method to render the
/// table not as a table, but by concatting the contents and writing it as
/// a bunch of text.
///
/// 'ghost' hint tells the pdf exporting method that the cell may be omitted
/// and ignored.
enum Hint { title, ghost, slim, none }
