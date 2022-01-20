# Create UEFI partitions
**fdisk /dev/sda**<br/>
<br/>
Command (m for help): **g**<br/>
Createtd a new GPT disklabel.<br/>
<br/>
Command (m for help): **n** (means creating new partition)<br/>
Created a new partition 1...<br/>
<br/>
Command (m for help): **1**<br/>
Partition number (1-128, default 1): **1 or Enter**<br/>
<br/>
First sector: **Enter for default**<br/>
Last sector: **+512M**<br/>
<br/>
Created a new partition 1...<br/>
Command (m for help): **t** (for type)<br/>
Selected partition 1<br/>
Partition type (type L for all types): **1**<br/>
<br/>
Command (m for help): **n**<br/>
Partition number (1-128, default 2): **2 or Enter**<br/>
First sector: **Enter for default**<br/>
Last sector: **+25000M**<br/>
<br/>
Command (m for help): **n**<br/>
Partition number (1-128, default 3): **3 or Enter**<br/>
First sector: **Enter for default**<br/>
Last sector: **Enter for default**<br/>
<br/>
Command (m for help): **w** (to write the changes)<br/>
<br/>
Done<br/>
