FROM python:3.7.6-slim-stretch
RUN apt-get update

# dependencies to download gcloud
RUN apt-get install apt-transport-https -y
RUN apt-get install ca-certificates -y
RUN apt-get install gnupg -y
RUN apt-get install curl -y
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# actually getting it
RUN apt-get update
RUN apt-get install google-cloud-sdk -y

# cleanup
RUN apt-get autoremove curl -y
