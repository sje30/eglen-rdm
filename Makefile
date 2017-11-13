MAIN =  eglen-rdm.html


all: $(MAIN)

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^')"

.PHONY: clean copy show

copy: $(MAIN)
	cp $(MAIN) ~/txt/hugo/sje30-mbw/static/talks/2017/
	cp -r eglen-rdm_files ~/txt/hugo/sje30-mbw/static/talks/2017/
	# add ? to end of .css file.
	sed -i '1,/RE/s/default.css"/default.css?"/' $(MAIN)
	sed -i '1,/RE/s/default-fonts.css"/default-fonts.css?"/' $(MAIN)
	deploy1.sh

# The sed lines are required to ensure that the css are refreshed, I don't know why!


clean:
	rm -f $(MAIN) 

show: $(MAIN)
	open $(MAIN)
