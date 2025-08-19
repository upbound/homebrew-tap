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

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.40.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '5d7bbb1411ef7be99c8b70aa260ca50bfb02a6d180a4830a9710ab11ad1ecfa4'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '5d8cfbb81d61f02fffe0ad0f0a19a102961701514ffd349142147a748602b9be'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '15082e2e59624b3f045df882efe0d9cbcdcdc0a07dfd2747dd02987e10a3f003'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.2/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'f789c277f781575a7ef0f384fed8581350e522a51bf8fedf237e8db700bbf280'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
