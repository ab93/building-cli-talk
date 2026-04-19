MARP := marp
SRC  := slides/slides.md
OUT  := slides/slides

.PHONY: all html pdf pptx clean

all: html pdf pptx

html: $(OUT).html
pdf:  $(OUT).pdf
pptx: $(OUT).pptx

$(OUT).html: $(SRC)
	$(MARP) $< -o $@ --html --allow-local-files

$(OUT).pdf: $(SRC)
	$(MARP) $< -o $@ --pdf --allow-local-files

$(OUT).pptx: $(SRC)
	$(MARP) $< -o $@ --pptx --allow-local-files

clean:
	rm -f $(OUT).html $(OUT).pdf $(OUT).pptx
