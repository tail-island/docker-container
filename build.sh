(cd base        && docker build --no-cache=true -t rojima1/base        .) && \
(cd clojure     && docker build                 -t rojima1/clojure     .) && \
(cd node        && docker build                 -t rojima1/node        .) && \
(cd python      && docker build                 -t rojima1/python      .) && docker push rojima1/python && \
# CUDA specified images
(cd base-cuda   && docker build --no-cache=true -t rojima1/base-cuda   .) && \
(cd python-cuda && docker build                 -t rojima1/python-cuda .) && docker push rojima1/python-cuda
