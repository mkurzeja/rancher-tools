# accesto/rancher-tools docker image
This image contains both rancher-compose and rancher cli tools.
Based on alpine to save space and transfer.

## Usage examples:
Running rancher cli:
```docker run --rm accesto/rancher-tools rancher```

Running rancher-compose:
```docker run --rm accesto/rancher-tools rancher-compose```

Environment variables same as used by both tools, in order to share files, mount them to the /workspace directory, ex:
```docker run --rm -eRANCHER_ACCESS_KEY=$RANCHER_ACCESS_KEY -eRANCHER_SECRET_KEY=$RANCHER_SECRET_KEY -eRANCHER_URL=$RANCHER_URL -v $PWD:/workspace accesto/rancher-tools rancher-compose  -p example up --upgrade --force-upgrade -d -c```