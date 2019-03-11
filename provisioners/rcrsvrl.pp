exec { 'sudo apt-get update':
  path => [
    '/usr/bin',
  ],
} -> apt::source { 'ros-latest':
  location => 'http://packages.ros.org/ros/ubuntu',
  repos    => 'main',
  key      => {
    'id'     => '6222B23C19C7E2656CCFA24D847F3CEFB01FA116',
    'server' => 'pool.sks-keyservers.net',
  },
  include  => {
    'deb' => true,
  },
} -> apt::source { 'gazebo-latest':
  location => 'http://packages.osrfoundation.org/gazebo/ubuntu',
  repos    => 'main',
  key      => {
    'id'     => 'D2486D2DD83DB69272AFE98867170598AF249743',
    'source' => 'http://packages.osrfoundation.org/gazebo.key',
  },
  include  => {
    'deb' => true,
  },
} -> exec { 'apt-update':
    command => '/usr/bin/apt-get update',
} -> package { [
	'cmake',
	'g++',
	'protobuf-compiler',
	'pavucontrol',
	'libignition-math3',
	'libsdformat5',
	'libignition-math3-dev',
	'libignition-msgs0-dev',
	'gazebo8-plugin-base',
	'libgazebo8',
	'libgazebo8-dev',
	'ros-kinetic-desktop',
	'ros-kinetic-ros-control',
	'ros-kinetic-ros-controllers',
	'ros-kinetic-image-view2',
	'ros-kinetic-rqt',
	'ros-kinetic-rqt-common-plugins',
	'ros-kinetic-joy',
	'ros-kinetic-teleop-twist-keyboard',
	'ros-kinetic-message-to-tf',
	'ros-kinetic-tf2-geometry-msgs',
	'ros-kinetic-audio-common',
	'ros-kinetic-costmap-2d',
	'ros-kinetic-image-transport',
	'ros-kinetic-image-transport-plugins',
	'ros-kinetic-hector-mapping',
	'ros-kinetic-hector-geotiff',
	'ros-kinetic-hector-pose-estimation',
	'ros-kinetic-hector-sensors-description',
	'ros-kinetic-controller-manager',
	'ros-kinetic-gmapping',
	'ros-kinetic-move-base',
	'ros-kinetic-gazebo8*'
   ]:
  ensure          => latest,
  install_options => ['--allow-unauthenticated'],
}
