# Note bash

```bash
    echo '#!/bin/bash'; while IFS= read -r line; do echo "echo '$line'"; done < motd-cli > motd.sh
```
