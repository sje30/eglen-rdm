MAIN =  eglen-rdm.html


all: $(MAIN)

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^')"

.PHONY: clean copy show

copy: $(MAIN)
	cp $(MAIN) ~/txt/hugo/sje30-mbw/static/talks/2017/
	##cp -r elife-figs ~/txt/hugo/sje30-mbw/static/talks/2017/
	deploy1.sh


clean:
	rm -f $(MAIN) 

show: $(MAIN)
	open $(MAIN)
