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
  version 'v0.42.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.42.0/bundle/darwin_amd64/up.tar.gz'
    sha256 'ac7e99c22529ab50bb7a6a5bc01b6a66b2d53c6acc8ea67134f365f13b547809'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.42.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'cc932f18001bd18d39613d437e4f6a5b3fb408ca6cdddca29bb020c27b4cbb95'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.42.0/bundle/linux_amd64/up.tar.gz'
    sha256 '38ba07f3832177b2a7c3097841f8a82b9a43fb2401bb3cfedcd9206b9f341761'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.42.0/bundle/linux_arm64/up.tar.gz'
    sha256 '43aa7a07fb487ba245994268eeac2624bbc1e0b0cf431a3105ced7967c75139c'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
