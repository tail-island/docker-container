(cd base        && docker build -name rojima1/base        .)
(cd clojure     && docker build -name rojima1/clojure     .)
(cd python      && docker build -name rojima1/python      .)
(cd base-cuda   && docker build -name rojima1/base-cuda   .)
(cd python-cuda && docker build -name rojima1/python-cuda .)
docker push rojima1/python
docker push rojima1/python-cuda
