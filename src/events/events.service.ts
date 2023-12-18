import { EventEntity } from './entities/event.entity';
import { Injectable } from '@nestjs/common';
import { CreateEventDto } from './dto/create-event.dto';
import { UpdateEventDto } from './dto/update-event.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class EventsService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createEventDto: CreateEventDto): Promise<EventEntity> {
    return this.prisma.eventos.create({
      data: createEventDto,
    });
  }

  async findAll(): Promise<EventEntity[]> {
    return this.prisma.eventos.findMany();
  }

  async findSomething(nome?: string, categoria?: string) {
    if (nome != null || categoria != null) {
      return this.prisma.eventos.findMany({
        where: {
          OR: [
            {
              nome_evento: {
                contains: nome,
              },
            },
            {
              categoria: {
                titulo: categoria,
              },
            },
          ],
        },
        select: {
          id_evento: true,
          nome_evento: true,
          endereco_evento: true,
          descricao: true,
          status_evento: true,
          data_evento: true,
          curtida: true,
          imagem_evento: true,
          categoria: {
            select: {
              titulo: true,
            },
          },
          usuario: {
            select: {
              id_usuario: true,
              nome: true,
              user_img: true,
              nivel_usuario: true,
            },
          },
        },
      });
    } else {
      return this.prisma.eventos.findMany({
        select: {
          id_evento: true,
          nome_evento: true,
          endereco_evento: true,
          descricao: true,
          status_evento: true,
          data_evento: true,
          curtida: true,
          imagem_evento: true,
          categoria: {
            select: {
              titulo: true,
            },
          },
          usuario: {
            select: {
              id_usuario: true,
              nome: true,
              user_img: true,
              nivel_usuario: true,
            },
          },
        },
      });
    }
  }

  async findID(id: number): Promise<EventEntity> {
    return this.prisma.eventos.findUnique({
      where: {
        id_evento: id,
      },
    });
  }

  async update(
    id: number,
    updateEventDto: UpdateEventDto,
  ): Promise<EventEntity> {
    return this.prisma.eventos.update({
      where: {
        id_evento: id,
      },
      data: updateEventDto,
    });
  }

  async remove(id: number): Promise<EventEntity> {
    return this.prisma.eventos.delete({
      where: {
        id_evento: id,
      },
    });
  }
}
