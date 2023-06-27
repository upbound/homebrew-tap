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
  version 'v0.18.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'abdef3b0168a493a424e6d4c4daba4edbffeaceea70f40687fcfda090e8c0771'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '8c75d580f9b47844cc2c860cef879958289d290f62c7df2e92f005271f64590d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '92f42b4ae0853f14b5e2c44fa5bb327dd6367ed07dc5985d7bdff554d94ed106'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'f00737095ab540f0224b68f5c550f8be571219c16f551855b1ef5a42ab763c48'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.18.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '281fe6bfc5398f4eef2c59d7b6ccd3cc46e2249a3921441f1eb8b5337bdd7779'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
