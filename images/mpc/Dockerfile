FROM dealerdirect/debian:jessie
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV INSTALL_APT_BUILD_DEPS "python-pip build-essential python-dev"
ENV INSTALL_APT "php5-cli php5-mcrypt php5-mysql php5-intl ruby libxml2-utils aspell gettext mysql-client python-six"
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
