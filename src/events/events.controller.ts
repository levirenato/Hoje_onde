import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Query,
} from '@nestjs/common';
import { EventsService } from './events.service';
import { CreateEventDto } from './dto/create-event.dto';
import { UpdateEventDto } from './dto/update-event.dto';
import { ApiQuery, ApiTags } from '@nestjs/swagger';

@ApiTags('Eventos')
@Controller('events')
export class EventsController {
  constructor(private readonly eventsService: EventsService) {}

  @Post()
  create(@Body() createEventDto: CreateEventDto) {
    return this.eventsService.create(createEventDto);
  }

  @Get(':id')
  findByID(@Param('id') id: number) {
    return this.eventsService.findID(+id);
  }

  @Get()
  @ApiQuery({ name: 'nome', required: false })
  @ApiQuery({ name: 'categoria', required: false })
  async findAll(@Query() query: { nome: string; categoria: string }) {
    return this.eventsService.findSomething(query.nome, query.categoria);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateEventDto: UpdateEventDto) {
    return this.eventsService.update(+id, updateEventDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.eventsService.remove(+id);
  }
}
