.DEFAULT_GOAL := help

all: render ## run styler and render

render: ## render slides
	Rscript -e "rmarkdown::render('slides.Rmd')"

styler: ## styler slides
	Rscript -e "styler::style_file('slides.Rmd')"

clean:  ## clean cache and remove slides.pdf
	rm slides.pdf
	rm -rf knitr_output

help:   ## show this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
