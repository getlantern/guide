.PHONY: all clean install_illuminated install_pandoc generate_docs

all: install_illuminated install_pandoc generate_docs

install_illuminated:
	git clone https://github.com/getlantern/illuminated.git
	cd illuminated/cmd && go build -o ../../illuminated
	rm -rf illuminated

install_pandoc:
	sudo apt-get update
	sudo apt-get install -y pandoc
	sudo apt-get install -y texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra

generate_docs: install_illuminated
	./illuminated generate --directory docs --join --html --pdf

clean:
	rm -f illuminated
