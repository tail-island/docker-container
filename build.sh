(cd base        && docker build -t rojima1/base        .)
(cd clojure     && docker build -t rojima1/clojure     .)
(cd python      && docker build -t rojima1/python      .)
(cd base-cuda   && docker build -t rojima1/base-cuda   .)
(cd python-cuda && docker build -t rojima1/python-cuda .)

docker push rojima1/python
docker push rojima1/python-cuda
