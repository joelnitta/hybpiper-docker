# hybpiper-docker

[Dockerfile](https://github.com/joelnitta/hybpiper-docker/blob/master/Dockerfile) and [image](https://hub.docker.com/r/joelnitta/hybpiper/) for running [HybPiper](https://github.com/mossmatters/HybPiper) with Python 3.

## Example Usage

Pull the most recent build:

```
docker pull joelnitta/hybpiper
```

### Running HybPiper within the container

Launch the container:

```
docker run --rm -it joelnitta/hybpiper
```

Check that all dependencies are installed:

```
cd /apps/HybPiper
python reads_first.py --check-depend
```

Run the [HybPiper tutorial](https://github.com/mossmatters/HybPiper/wiki/Tutorial):

```
cd test_dataset
tar -zxvf test_reads.fastq.tar.gz
../reads_first.py -b test_targets.fasta -r NZ281_R*_test.fastq --prefix NZ281 --bwa

...
```

### Running HybPiper from outside the container

Alternatively, you can run `HybPiper` commands directly from the command line by mounting a volume.

For example, mount `/working/dir` containing `test_targets.fasta`, `NZ281_R1_test.fastq`, and `NZ281_R2_test.fastq` from the tutorial data, and run `reads_first.py`:

```
docker run --rm --entrypoint reads_first.py -v /working/dir:/home joelnitta/hybpiper -b test_targets.fasta -r NZ281_R*_test.fastq --prefix NZ281 --bwa
```
