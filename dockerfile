# Use builds from launchpad
FROM opencpu/base

# Install development tools
RUN \
  apt-get update && apt-get install -y rstudio-server r-base-dev sudo curl git libcurl4-openssl-dev libssl-dev libxml2-dev libssh2-1-dev libsasl2-dev

RUN Rscript -e "install.packages(c('mongolite'));devtools::install_github('rsangra/fhirexample');"
#ADD ./Rprofile.site /etc/R/Rprofile.site
# Workaround for rstudio apparmor bug
RUN echo "mongoUrl=mongodb://sparkadmin:PrUDrebuSeS85ruzeRe3u7espEcHApRa@mongotestserver.australiaeast.cloudapp.azure.com:27127/sparkff01stu3" >> /etc/R/Renviron.site
RUN echo "mDb=sparkff01stu3" >> /etc/R/Renviron.site
RUN echo "mCollection=resources" >> /etc/R/Renviron.site

RUN echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf
CMD service cron start && /usr/lib/rstudio-server/bin/rserver && apachectl -DFOREGROUND