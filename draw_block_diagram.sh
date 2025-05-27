cd processor
yosys -q yscripts/block_diagram.ys
cd ..
cp /root/.yosys_show.dot ./sail.dot
python3 ./dotExtract.py

