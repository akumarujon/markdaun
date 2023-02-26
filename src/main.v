module main

import os
import markdown

fn main() {
	text := os.args[1]
	lines := os.read_file(text)!
	md := markdown.to_html(lines)
	os.write_file("output.html",'<!DOCTYPE html>
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
