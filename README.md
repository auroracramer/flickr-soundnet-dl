# flickr-soundnet-dl
This repository contains a script for downloading Flickr-SoundNet dataset used in Look, Listen and Learn (Arandjelovic, Zisserman; 2017)

Dependencies
* Python 3
* [ffmpeg](http://www.ffmpeg.org) (and ffprobe)
* `libsndfile1`
* [sox](http://sox.sourceforge.net/)

You can install the Python dependencies with `pip install -r requirements.txt`


`flickr.py` is the script you should run to download the dataset. Run `flickr.py -h` to read the help message describing how to use the script. Note that you may need to add the directory containing `ffmpeg` and `ffprobe` to your path so that `skvideo` works properly under multithreading. The way it sets module-wide state does not seem threadsafe.

You can obtain the list of URLs used in this dataset [here](http://data.csail.mit.edu/soundnet/urls_public.txt). Note that some of them do not work. The script tries to deal with it, but it is possible that some of the videos will not be downloaded.

If you use a SLURM environment, `flickr-soundnet-dl-job-array.sbatch` contains a script you can use to run a job array to download the files, provided you use `split_dataset_file.sh <url_list_path> <num_parts>` to split the URL file into parts.
