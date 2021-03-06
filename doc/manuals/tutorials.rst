Tutorials
=========

The following sections describe executing set of DIVA executables to demonstrate the system. |br|
Visit the `repository <https://github.com/Kitware/DIVA>`_ on how to get and build the DIVA code base.

These instructions provided assume that the DIVA superbuild pulled and built Fletch, KWIVER, and KWANT. |br|
Hence the following directory structure will be assumed :

* DIVA

  * Source - This is unique to your machine and is referred to as ``</path/to/DIVA/source>``

    * drivers - All C++ and Python example code
    * utils - DIVA C++ and Python API library

  * Build - This is unique to your machine and is referred to as ``</path/to/DIVA/build>``

    * DIVA - Empty
    * DIVA-build - Build DIVA libraries
    * install - Built libraries, executables, and environment set-up script
    * fletch - Source code pulled from fletch repository
    * fletch-build - Built fletch libraries
    * kwant - Source code pulled from kwant repository
    * kwant-build - Built kwant libraries and executables
    * kwiver - Source code pulled from kwiver repository
    * kwiver-build - Built kwiver libraries

Note the above Build install directory will be refered to as ``</path/to/DIVA/install>``

All the source code used to make these executables is provided in the `driver directory of the repository <https://github.com/Kitware/DIVA/tree/master/drivers>`_. 

All of the provided C++ and Python executables that require the necessary DIVA environment variables set.
To set-up your environment, run this setup_DIVA script from the Diva-build directory :

.. code-block:: bash

  </path/to/DIVA/install>$ source setup_DIVA.sh

The following python packages are required:
* numpy
* matplotlib

You will also need to (apt) install the following packages:
* python-tk
 

The following executables demonstrate how to use the DIVA :doc:`C++ and Python utility library</api>` to read and write :doc:`KPF</kpf>`, 
the data/file format DIVA will use for specifying an experiment and its results for scoring.

As always, we would be happy to hear your comments and receive your contributions on any tutorial.

Schema Examples
---------------

These executables focuses on the API classes used to writing valid KPF results files for scoring. |br|
The code provided simply instantiates KPF packet classes, populates them with data, and writes their contents to the console. |br|
The intent of this executable is to demonstrate the code necessary by the performer to convert their results into the common scorable KPF format.

C++
~~~

A simple `C++ executable <https://github.com/Kitware/DIVA/blob/master/drivers/schema_examples/schema_examples.cpp>`_ is provided to generate some KPF objects. 
To run this example, do the following:

.. code-block:: bash

  </path/to/DIVA/install>$ ./bin/schema_examples
  # You will get the following output
  - { meta: Example geometry }
  - { meta: 1 tracks; 50 detection }
  - { meta: min / max frame: 0 942 min / max timestamp: 0 471  }
  - { meta: min / max geometry: 0,289 - 1278 719 ( 1279x431+0+289 ) }
  - { geom: { id0: 0, id1: 66, ts0: 0, g0: 104 349 210 385, src: truth, eval_type: tp, occlusion: heavy, poly0: [[ 100, 399 ],[ 200, 398 ],[ 300, 397 ],],  } }
  ...

Python
~~~~~~

A simple `Python executable script <https://github.com/Kitware/DIVA/blob/master/drivers/schema_examples/schema_examples.py>`_ is provided to generate some KPF objects. 
To run this example, do the following:

.. code-block:: bash

  </path/to/DIVA/install>$ python ./python/schema_examples.py
  # You will get the following output
  Geometry Content
  - { meta: Example geometry }
  - { meta: 1 tracks; 50 detection }
  - { meta: min / max frame: 0 942 min / max timestamp: 0 471  }
  - { meta: min / max geometry: 0,289 - 1278 719 ( 1279x431+0+289 ) }
  - { geom: { id0: 0, id1: 66, ts0: 0, g0: 104 349 210 385, src: truth, eval_type: tp, occlusion: heavy, poly0: [[ 100, 399 ],[ 200, 398 ],[ 300, 397 ],],  } }
  ...


Basic Experiment
----------------

This executable demonstrates 2 things :

* Demonstrating writing an experiment file using the Experiment API class
* Demonstrate getting individual frames from an experiment source

First we will look at how to run the code provided to simply instantiates an instance of the Experiment class, populates it with data, and writes its contents to the console. |br|
The intent of this example is to demonstrate the code necessary by the performer to write a valid experiment file. |br|

C++
~~~

A simple `C++ executable <https://github.com/Kitware/DIVA/blob/master/drivers/basic_experiment/basic_experiment.cpp>`_ is provided to read and write experiment files. 
To run this example, do the following:

.. code-block:: bash

  # This will write out a new file 'example.yml' experiment file in the current directory
  </path/to/DIVA/install>$ ./bin/basic_experiment -s example.yml

As we mentioned above, the DIVA API can provide image frames from the input source specified for an experiment. |br|
Two example experiment files are provided, one that sources a list of images, and another that sources a video file. |br|
The intent of this example is to demonstrate the performer can use the API to easily get frames from any source and use them in their code. |br|
To run this example, do the following from the BUILD directory :

.. code-block:: bash

  # The image experiment displays frames from a list of images specified in a txt file
  </path/to/DIVA/install>$ ./bin/basic_experiment -d ./etc/image_experiment.yml
  # The video experiment displays frames from a video file
  </path/to/DIVA/install>$ ./bin/basic_experiment -d ./etc/video_experiment.yml



Darknet Object Detection
------------------------

The intent of this executable is to demonstrate using the DIVA API to:

* Read an experiment file
* Get individual frames from the experiment source
* Perform the Darknet object detection algorithm on each frame
* Translate Darknet results into the KPF Geometry object
* Write the KPF objects into a scorable results file on disk

C++
~~~

A simple `C++ executable <https://github.com/Kitware/DIVA/blob/master/drivers/darknet_detections/darknet_detections.cpp>`_ is provided for this example. 
To run this example, do the following:

.. code-block:: bash

  </path/to/DIVA/install>$ ./bin/darknet_detections -r ./etc/image_experiment.yml
  # Note the output 'darknet.geom.yml' file will be written to the algo-out directory under current directory
  # To run Darknet with a video source
  </path/to/DIVA/install>$ ./bin/darknet_detections -r ./etc/video_experiment.yml
  # Note the output 'darknet.geom.yml' file will be written to the algo-out directory under current directory
  # Score the out put with this command 
  </path/to/DIVA/install>$ python ./python/diva_system.py score ./etc/image_experiment.yml
  # Note the video experiment does not support scoring at this point
  # Scored outputs will be found in the </path/to/DIVA/install>/etc/eval-out directory


Activity Detection
------------------

Coming Soon!!

.. |br| raw:: html

   <br />
