import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from 'src/prisma/prisma.service';


@Injectable()
export class UsersService {
  constructor(private prismaService: PrismaService) {}
  async create(createUserDto: CreateUserDto) {
    return await this.prismaService.usuario.create({
      data: createUserDto,
    });
  }

  findAll() {
    return this.prismaService.usuario.findMany();
  }

  findOne(id: number) {
    return this.prismaService.usuario.findUnique({
      where: { id_usuario: id },
    });
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return this.prismaService.usuario.update({
      where: { id_usuario: id },
      data: updateUserDto,
    });
  }

  remove(id: number) {
    return this.prismaService.usuario.delete({ where: { id_usuario: id } });
  }
}
