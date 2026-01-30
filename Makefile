.PHONY: all clean install_illuminated install_pandoc generate_docs update_docs

all: install_illuminated install_pandoc generate_docs

install_illuminated:
	git clone https://github.com/getlantern/illuminated.git
	cd illuminated && git checkout jay/size && cd cmd && go build -o ../../illuminate
	rm -rf illuminated # delete the project directory

install_pandoc:
	sudo apt-get update
	sudo apt-get install -y pandoc
	sudo apt-get install -y texlive-xetex texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
	sudo apt-get install -y fonts-dejavu fonts-noto

generate_docs: install_illuminated install_pandoc
	./illuminate generate --verbose \
		--source https://github.com/getlantern/guide.wiki.git \
		--base "en" \
		--languages "en,ru,fa,ar" \
		--translator "google" \
		--title "User Guide" \
		--html \
		--pdf \
		--join \
		--force

clean:
	rm -f illuminated
