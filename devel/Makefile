#! make

all: kthb-slides.html index.html

kthb-slides.html:
	# needs pandoc system lib and tinytex R package
	# tinytex::install_tinytex()
	R -e "rmarkdown::render('kthb-slides.Rmd')"

index.html:
	# using docker image gaow/staticrypt for the utility
	# takes the ".html" from the present working directory, use your own file
	# outputs a "-x.html" file that needs unlocking with the given password

	docker run --rm -u $(UID):$(GID) -v "$(PWD):/tmp" -e SECRET=$(SECRET) gaow/staticrypt \
	staticrypt /tmp/kthb-slides.html $(SECRET) -o /tmp/index-x.html
	mv index-x.html index.html

deploy:
	mkdir -p ../docs/slides
	cp index.html ../docs/slides
	cp abm.html ../docs/slides
