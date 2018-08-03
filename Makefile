
RMDS=index.Rmd slides/slides.Rmd topics/bioconductor.Rmd

HTMLS=$(patsubst %.Rmd,%.html,$(RMDS))

all : $(HTMLS)

%.html : %.Rmd slides/slides_presenter.html
	Rscript -e 'rmarkdown::render("$<", "all")'

slides/slides_presenter.html : slides/slides.Rmd slides/style_presenter.css Makefile
	Rscript -e 'rmarkdown::render("$<", output_file="slides_presenter.html", output_options=list(css="style_presenter.css"))' 

clean :
	rm -f $(HTMLS)
