FROM dealerdirect/debian:buster
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV INSTALL_APT_BUILD_DEPS "python3-pip python3-wheel build-essential python3-dev ruby-dev"
ENV INSTALL_APT "gnupg2 php7.3-cli php7.3-intl ruby libxml2-utils aspell gettext mariadb-client python-six"
ENV INSTALL_PIP "yamllint flake8 pydocstyle"
ENV INSTALL_NPM "nomnom@1.6 jsonlint editorconfig-tools alex markdown-spellcheck remark-cli remark-lint remark-lint-books-links remark-lint-no-empty-sections remark-lint-no-url-trailing-slash remark-validate-links remark-preset-lint-dealerdirect"
ENV INSTALL_GEM "rubocop"

ADD files/shared/scripts/*.sh /tmp/shared/scripts/
ADD files/mpc/.remarkrc /root/.remarkrc
ADD files/yamllint /root/.config/yamllint

RUN \
    bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
    bash /tmp/shared/scripts/install-shellcheck.sh && \
    bash /tmp/shared/scripts/install-pip.sh && \
    bash /tmp/shared/scripts/install-nodejs.sh && \
    bash /tmp/shared/scripts/install-gem.sh && \
    bash /tmp/shared/scripts/cleanup.sh
