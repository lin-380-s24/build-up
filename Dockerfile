# Dockerfile

# Use the rocker/r-ver image as the base image.
FROM rocker/r-ver:4.3.2

# Environment variables.
ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=2023.12.0+369
ENV DEFAULT_USER=rstudio
ENV PANDOC_VERSION=default
ENV QUARTO_VERSION=default

# Install scripts from the rocker_scripts directory.
RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh
RUN /rocker_scripts/install_quarto.sh


# Ports to expose.
EXPOSE 8787

# Init system.
CMD ["/init"]
