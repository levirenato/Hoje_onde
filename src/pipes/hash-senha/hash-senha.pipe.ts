import { Injectable, PipeTransform } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as bcrypt from 'bcrypt';

@Injectable()
export class HashSenhaPipe implements PipeTransform {
  constructor(private configService: ConfigService) {}
  async transform(senha: string): Promise<string> {
    const sal = '$2b$10$Q.errXW15vHL0OoOAZyaFu';
    const senhaHash = await bcrypt.hash(senha, sal);
    return senhaHash;
  }
}
