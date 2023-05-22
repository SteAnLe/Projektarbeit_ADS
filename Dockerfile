FROM jupyter/datascience-notebook

# run this before copying requirements for cache efficiency & latest verson of pip
#RUN pip install --upgrade pip

#set work directory early so remaining paths can be relative
#WORKDIR /home/jovyan/work

# Copy requirements.txt
#COPY requirements.txt .

# Copy local files into the image
COPY . ./work/

# Install additional Python libraries
RUN pip install -r ./work/requirements.txt 

# Change ownership and permissions recursively
USER root
RUN chown -R jovyan:users /home/jovyan/work && \
    chmod -R 755 /home/jovyan/work

# Switch to non-root user
USER jovyan

