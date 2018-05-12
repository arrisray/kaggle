FROM continuumio/anaconda3:latest

RUN \
    mkdir /opt/notebooks \
    && pip install \
        --upgrade pip \
        kaggle \
    && conda update conda \
    && conda install \
        pandas matplotlib jupyter notebook scipy scikit-learn nb_conda nltk \
    && conda install -c \
        conda-forge tensorflow

COPY api/kaggle.json /root/.kaggle/kaggle.json 
RUN chmod 600 /root/.kaggle/kaggle.json

CMD ["/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip='*'", "-port=8888", "--no-browser"]