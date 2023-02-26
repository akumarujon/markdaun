module main

import flag
import os
import markdown

fn main() {
mut fp := flag.new_flag_parser(os.args)
    fp.application('markdaun')
    fp.version('v0.0.1')
    fp.description('MD2HTML tool wtitten in V.')
    fp.skip_executable()
    input := fp.string('input', `i`, "Input is required","Input file(Markdown file)")
	output := fp.string('output', `o`, "Output is required", "Output file(HTML file)")
	
	lines := os.read_file(input)!
	md := markdown.to_html(lines)
	os.write_file(output,'<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    '+ md + "</body>
</html>")!
}
