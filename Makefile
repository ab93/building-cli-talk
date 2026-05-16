MARP := marp
SRCDIR := slides
SRC  := slides.md
OUT  := slides

.PHONY: all html pdf pptx clean

all: html pdf pptx

html:
	cd $(SRCDIR) && $(MARP) $(SRC) -o $(OUT).html --html --allow-local-files

pdf:
	cd $(SRCDIR) && $(MARP) $(SRC) -o $(OUT).pdf --pdf --allow-local-files

pptx:
	cd $(SRCDIR) && $(MARP) $(SRC) -o $(OUT).pptx --pptx --allow-local-files

clean:
	rm -f $(SRCDIR)/$(OUT).html $(SRCDIR)/$(OUT).pdf $(SRCDIR)/$(OUT).pptx
