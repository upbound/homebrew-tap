# frozen_string_literal: true

# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class Up < Formula
  desc 'The official Upbound CLI'
  homepage 'https://upbound.io'
  version 'v0.28.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '0d220cd89431fec14fc7028edc5dcdc217c250f7c4e7e921a8f7bb96c382ab71'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '05085b5bb9316d3483a862e0dd6b0f9a3ba7dab25f4766ec246e2d8706eb4410'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/up/linux_amd64.tar.gz'
    sha256 '6c043bfb5c7862c7e9211c0c1bac90191b6ab9a475b7311b5a8a3e72d7a452b7'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/up/linux_arm.tar.gz'
    sha256 '47ab1941a1ac7f98c5229e247508b19f2c70ae69db93ac2b33c45cbcf356f124'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/up/linux_arm64.tar.gz'
    sha256 'c3c4607fb566b1cce85dca2ce0075a54d0f22128be854d6cc51276f14d33fdea'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
