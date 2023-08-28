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
  version 'v0.19.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '889abafed5fdd9068da160f56b69a589fa23a5526fb31b325d05836ed94182a6'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'f255c119499392b47fa2cdb041afe81f63c58b1b90303c5234a355d9c8373d7d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/up/linux_amd64.tar.gz'
    sha256 '6963094a344be62de08dbe40b04149629dbb8dc4df328b4d74fd96d1b42e0cf9'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/up/linux_arm.tar.gz'
    sha256 '9455f50373f24610430c2c07f800ba800d10b4f09c7d825e6592e77b22bed344'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.0/bundle/up/linux_arm64.tar.gz'
    sha256 '1584fc11ce8e6c012fa68fccae76b6d657173433506fd1cea2c868970bcac097'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
