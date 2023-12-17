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

  async findName(categoria: string): Promise<EventEntity[]> {
    return this.prisma.eventos.findMany({
      where: { categoria: { titulo: categoria } },
      include: { categoria: true },
    });
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
