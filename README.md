# hybpiper-docker

[Dockerfile](https://github.com/joelnitta/hybpiper-docker/blob/master/Dockerfile) and [image](https://hub.docker.com/r/joelnitta/hybpiper/) for running [HybPiper](https://github.com/mossmatters/HybPiper) with Python 3.

## Example Usage

Pull the most recent build:

```
docker pull joelnitta/hybpiper
```

Launch the container:

```
docker run --rm -it joelnitta/hybpiper
```

You should now be in `/home/` directory in the container, which also contains `HybPiper/`.

Check that all dependencies are installed:

```
cd HybPiper
python reads_first.py --check-depend
```

Run the [HybPiper tutorial](https://github.com/mossmatters/HybPiper/wiki/Tutorial):

```
cd test_dataset
tar -zxvf test_reads.fastq.tar.gz
../reads_first.py -b test_targets.fasta -r NZ281_R*_test.fastq --prefix NZ281 --bwa

...
```
