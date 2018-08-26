
HTMLS=index.html topics/bioconductor.html
PDFS=slides/slides.pdf slides/bioconductor_slides.pdf

all : $(HTMLS) $(PDFS)

%.html : %.Rmd
	Rscript -e 'rmarkdown::render("$<", "all")'

%.pdf : %.Rmd
	Rscript -e 'rmarkdown::render("$<", "all")'

BRM5012-files.zip : BRM5012-files/*
	zip -FSr BRM5012-files.zip BRM5012-files/

clean :
	rm -f $(HTMLS) $(PDFS)
